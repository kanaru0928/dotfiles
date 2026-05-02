---
name: serena-workflow
description: Use Serena MCP tools effectively when implementing code changes. Trigger this skill whenever writing new code, modifying existing code, debugging, or exploring a codebase that has Serena available. The skill enforces a memory-first orientation, symbol-level navigation and editing, and full use of Serena's code intelligence capabilities to produce changes consistent with project patterns.
---

<purpose>
  Defines the workflow for using Serena MCP tools effectively on coding tasks.
  Serena provides two major capabilities: persistent project memory (conventions, decisions, patterns)
  and symbol-level code intelligence (navigate and edit code without reading entire files).
  Using both ensures implementations that fit the project's architecture and minimize wasted context.
</purpose>

<rules priority="MUST" name="Pre-Implementation Memory Check">
  <do>Before writing any code, call list_memories to discover what the project has recorded.</do>
  <do>Call read_memory for each memory relevant to the current task — conventions, patterns, architectural decisions, known pitfalls.</do>
  <do>If the memory list is empty, proceed without it — but note whether insights from this session are worth persisting for the future.</do>
  <avoid>Skipping the memory check on the assumption that you already know the project conventions. Memory may contain decisions that are not visible in the source code.</avoid>
</rules>

<workflow priority="MUST" name="Implementation Workflow">
  <phase name="Memory Check">Call list_memories. Read any memories that apply to the current task using read_memory.</phase>
  <phase name="Orientation">Use get_symbols_overview on the relevant file(s) to understand structure. Use find_symbol or find_declaration to locate the exact target symbol.</phase>
  <phase name="Impact Analysis">Use find_referencing_symbols and find_implementations to understand how the target symbol is used across the codebase before modifying it.</phase>
  <phase name="Implementation">Apply changes with symbol-level tools. Choose the narrowest tool that fits the change.</phase>
  <phase name="Verification">Call get_diagnostics_for_file on modified files. Run tests or build via execute_shell_command if a test suite or build step exists.</phase>
  <phase name="Memory Update">If this session revealed patterns, conventions, or decisions that would help future sessions, persist them with write_memory. Update stale entries with edit_memory.</phase>
</workflow>

<rules priority="MUST" name="Symbol-Level Navigation">
  <do>Use get_symbols_overview to understand a file's structure before editing anything in it.</do>
  <do>Use find_symbol or find_declaration to jump directly to the definition of a symbol.</do>
  <do>Use find_referencing_symbols and find_implementations to map the downstream impact of a change.</do>
  <avoid>Reading entire files when only a specific function, class, or method is needed.</avoid>
  <examples>
    <bad>Read the entire auth.ts file to find where validateToken is defined.</bad>
    <good>Call find_symbol with "validateToken" to jump directly to the definition.</good>
  </examples>
</rules>

<rules priority="MUST" name="Symbol-Level Modification">
  <do>Apply changes through Serena's surgical tools: replace_symbol_body, insert_after_symbol, insert_before_symbol, rename_symbol, safe_delete_symbol.</do>
  <do>Use replace_content for line-range edits when a change does not align cleanly with symbol boundaries.</do>
  <do>Use create_text_file only when creating a new file from scratch.</do>
  <avoid>Rewriting whole files when only one symbol needs to change.</avoid>
  <examples>
    <bad>Read the entire service.py, modify the function body, and write the whole file back.</bad>
    <good>Call replace_symbol_body to rewrite only the target function, leaving the rest of the file untouched.</good>
  </examples>
</rules>

<rules priority="SHOULD" name="Other Serena Capabilities">
  <do>Use search_for_pattern to find usages, string literals, or regex patterns across the codebase when a symbol search is too narrow or the target is not a named symbol.</do>
  <do>Use find_file to locate files by name pattern when the full path is unknown.</do>
  <do>Use list_dir to survey a directory before deciding which files to work with.</do>
  <do>Use execute_shell_command for build steps, linting, formatting, and test runs.</do>
  <do>Use get_diagnostics_for_file proactively — not only after an error — to catch issues early in the editing cycle.</do>
</rules>

<rules priority="SHOULD" name="Memory Hygiene">
  <do>Keep memory entries focused on facts that are non-obvious from reading the source: why a pattern exists, a constraint not visible in code, a decision that was made and the rationale behind it.</do>
  <do>Update stale memories with edit_memory if the project has evolved beyond what was stored.</do>
  <do>Remove obsolete memories with delete_memory rather than letting them accumulate and mislead future sessions.</do>
  <avoid>Storing information already derivable from reading the code or commit history — memory is for the non-obvious.</avoid>
</rules>
