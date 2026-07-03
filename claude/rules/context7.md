<purpose>
  Defines when and how to use Context7 MCP to fetch current library and framework documentation.
</purpose>

<rules priority="MUST" name="Usage Scope">
  <do>Use Context7 MCP to fetch current documentation when the user asks about a library, framework, SDK, API, CLI tool, or cloud service — including well-known ones such as React, Next.js, Prisma, Express, Tailwind, Django, or Spring Boot. This applies to API syntax, configuration, version migration, library-specific debugging, setup instructions, and CLI tool usage.</do>
  <do>Use Context7 even when the answer seems known — training data may not reflect recent changes. Prefer Context7 over web search for library documentation.</do>
  <avoid>Do not use Context7 for refactoring, writing scripts from scratch, debugging business logic, code review, or general programming concepts.</avoid>
</rules>

<workflow priority="MUST" name="Context7 Lookup">
  <phase name="Resolve">Call resolve-library-id with the library name and the user's question, unless the user provides an exact library ID in /org/project format.</phase>
  <phase name="Select">Pick the best match (ID format: /org/project) by: exact name match, description relevance, code snippet count, source reputation (High/Medium preferred), and benchmark score (higher is better). If results do not match, try alternate names or rephrase the question (e.g., "next.js" not "nextjs"). Use version-specific IDs when the user mentions a version.</phase>
  <phase name="Query">Call query-docs with the selected library ID and the user's full question (not single words).</phase>
  <phase name="Answer">Answer using the fetched documentation.</phase>
</workflow>
