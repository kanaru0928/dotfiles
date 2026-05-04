# Implementation Rules

<purpose>
  Establish rules to be followed during implementation by Claude to maintain high accuracy.
</purpose>

<workflow priority="MUST" name="Implementation Flow">
  <phase name="Discovery">Explore the code and confirm existing implementation patterns.</phase>
  <phase name="Planning">Plan the implementation to satisfy the user's requirements.</phase>
  <phase name="Refinement">Verify whether the plan satisfies the user's requirements. Confirm that all requirements are met and that nothing outside the requirements is planned. Additionally, ensure that the chosen method reliably fulfills the requirements. In "plan mode," request the user's approval of the plan once this phase is complete.</phase>
  <phase name="Implementation">Implement based on the plan.</phase>
  <phase name="Verification">Confirm that the implementation satisfies the user's requirements. Verify code quality using linting and builds.</phase>
</workflow>

<rules priority="MUST" name="Exploration Rules">
  <do>Use serena to reduce token consumption.</do>
  <avoid>Do not reference more files than necessary.</avoid>
</rules>

<rules priority="MUST" name="Planning Rules">
  <do>Research best practices to ensure user requirements are satisfied. If intentionally deviating from best practices, inform the user accordingly.</do>
  <do>Create a plan that satisfies all user requirements.</do>
  <avoid>Do not plan changes that fall outside the scope of the user's requirements.</avoid>
  <do>If returning to the planning phase from the implementation or verification phases, switch to "plan mode" first.</do>
  <do>
    Do not make changes that result in a regression or degradation of the existing plan.
    <examples>
      <bad>
        Because the proposed library usage did not work well, you downgrade the version or use deprecated functions instead.
      </bad>
      <bad>
        Because the user requested not to use a specific feature, you provide an obviously redundant or vulnerable implementation without investigating the intent.
      </bad>
    </examples>
  </do>
</rules>

<rules priority="MUST" name="Refinement Rules">
  <do>Return to the planning phase if any deficiencies are found.</do>
  <avoid>Do not allow unnecessary workarounds.</avoid>
  <avoid>Do not allow unnecessary deviations from best practices.</avoid>
  <avoid>Do not allow vulnerabilities.</avoid>
</rules>

<rules priority="SHOULD" name="Library Usage">
  <do>When using libraries, verify if the library is up-to-date, if a successor exists, if its use is appropriate for the requirements, and if it is actively maintained.</do>
  <avoid>Do not hardcode version numbers when installing libraries.</avoid>
  <do>When verifying library functions or usage, check official online documentation or the code directly. In particular, refer to usage examples provided in official documentation.</do>
  <avoid>Do not implement library usage based on inference or assumptions.</avoid>
</rules>

<rules priority="MUST" name="Implementation Rules">
  <do>Implement according to the plan.</do>
  <avoid>Do not perform implementations that are outside of the plan.</avoid>
  <do>If an implementation outside the plan becomes necessary—no matter how minor—always consult the user and return to the planning phase if needed.</do>
</rules>

<rules priority="MUST" name="Verification Rules">
  <do>If deficiencies are discovered during verification, report them to the user immediately and propose the next course of action. Return to the implementation or planning phases as necessary.</do>
</rules>
