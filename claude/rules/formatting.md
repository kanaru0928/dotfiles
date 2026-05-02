# Formatting Rules

<purpose>
  Defines writing and formatting rules to ensure responses are clear, specific, and consistent.
</purpose>

<rules priority="MUST" name="Expression and Vocabulary">
  <do>Use specific, fact-based expressions when explaining technologies and features.</do>
  <do>Keep information to the absolute minimum in work reports and status explanations.</do>
  <avoid>AI-typical adjectives: "本格的な", "モダンな", "最新の", "革新的な", "先進的な", "画期的な", "効率的な", "最適化された", "高度な", "包括的な", "直感的な", "柔軟な", "堅牢な", "スケーラブル", "洗練された", "シームレス", "統合された", "カスタマイズ可能", "ユーザーフレンドリー", "次世代"</avoid>
  <avoid>Sensory or abstract expressions such as 非常に高速, 素晴らしい, 画期的, and 基本的に
    <examples>
      <bad>このシステムは非常に高速です。</bad>
      <good>このシステムは、リクエストを 50 ミリ秒未満で処理します。</good>
    </examples>
  </avoid>
  <avoid>Assertive or speculative expressions such as 〜するはずです, 間違いなく, 将来〜でしょう, 完璧, and 究極
    <examples>
      <bad>この設定で、パフォーマンスが改善するはずです。</bad>
      <good>この設定は、パフォーマンスの改善が期待できます。</good>
    </examples>
  </avoid>
  <avoid>Redundant phrases: まず最初に, 〜することができます, 〜する必要があります, 〜するということができます
    <examples>
      <bad>まず最初に、これを実行します。</bad>
      <good>まず、これを実行します。</good>
    </examples>
    <examples>
      <bad>この機能は、データを保存することができます。</bad>
      <good>この機能でデータを保存できます。</good>
    </examples>
    <examples>
      <bad>その設定を行う必要があります。</bad>
      <good>その設定を行ってください。</good>
    </examples>
  </avoid>
</rules>

<rules priority="MUST" name="Sentence Structure">
  <do>Use active voice to clarify the subject (who or what performs the action).</do>
  <do>Write sentences to the end using verbs or auxiliary verbs — avoid 体言止め.</do>
  <do>Use a colon only when the preceding text ends with a noun (e.g., 注意点：). Do not place a colon after a verb or auxiliary verb.</do>
  <examples>
    <bad>データはサーバーによって処理されます。</bad>
    <good>サーバーがデータを処理します。</good>
  </examples>
  <examples>
    <bad>エラーの原因は、ネットワーク接続の切断。</bad>
    <good>エラーの原因は、ネットワーク接続が切断されたことです。</good>
  </examples>
  <examples>
    <bad>以下の手順を実行します：</bad>
    <good>以下の手順で実行します。</good>
  </examples>
</rules>

<rules priority="MUST" name="Notation and Formatting">
  <do>Standardize the notation of words referring to the same object, technical terms, and proper nouns within the text.</do>
  <do>Write list items using plain text only — do not format items in bold alone, and do not prefix items with emojis.</do>
  <examples>
    <bad>- **リンゴ**</bad>
    <good>- リンゴ</good>
  </examples>
  <examples>
    <bad>- ✅ タスク A</bad>
    <good>- タスク A</good>
  </examples>
  <examples>
    <bad>JavaScript と javascript が混在</bad>
    <good>JavaScript に統一する</good>
  </examples>
</rules>
