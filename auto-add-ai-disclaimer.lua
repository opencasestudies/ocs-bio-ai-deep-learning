-- auto-add-ai-disclaimer.lua
function Div(el)
  if el.classes:includes("ai_box") then

    -- Margin note (as Markdown) (no leading spaces so it will format during rendering)

    local md = [[
**AI Use Disclaimer:**

* Follow any relevant required guidelines/policies for AI use.
<details> <summary>Examples</summary> Your team or lab, institution, funding organization, or publisher. These requirements should take precedence over our suggestions. </details>

* Check AI responses critically, as they may be inaccurate, out-of-date, incomplete, or unnecessarily complicated.
  <details> <summary>Examples</summary> 
 
  * Always validate the existence and relevance of suggested citations or packages.
  * Review, test, possibly simplify, and work to understand generated code or functions.
  * Validate factual information using reliable sources.
  * Exercise extra caution with code in certain instances: code that installs packages, accesses or modifies files or data, uses credentials, or sends information over the internet.
  </details>
    
* [Disclose](https://aiattribution.github.io/) your AI use (including model and versions).


* Never provide sensitive data to a public AI tool. <details><summary>Examples</summary> Patient or student data, passwords, credentials, API keys, unpublished manuscripts or grants, and other proprietary code or internal documents.</details> 
* Be specific in your prompts and ask the AI tool to help you understand the code.
* The confidence of an AI tool does not indicate if its responses are correct. They may also agree with you when you are wrong.
* AI may respond differently to the same repeated prompt. Be sure to document what you can for the sake of reproducibility.
* Recognize that you may need to iteratively improve your prompt to reach the desired output.
     ]]

    -- Parse Markdown into Pandoc AST blocks
    local blocks = pandoc.read(md).blocks

    -- Create the margin note block
    local margin = pandoc.Div(
      blocks,
      pandoc.Attr("", {"column-margin"})
    )

    -- Return the original block *followed by* the margin block
    return { el, margin }
  end
end
