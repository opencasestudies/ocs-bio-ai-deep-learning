-- auto-add-ai-disclaimer.lua
function Div(el)
  if el.classes:includes("ai_box") then

    -- Margin note (as Markdown) (no leading spaces so it will format during rendering)

    local md = [[
**AI chatbot use Disclaimer:**

* Never provide sensitive data to a public AI chatbot.
* Be specific in your prompts and ask the chatbot to help you understand code, instead of simply providing it.
* Recognize that you may need to iteratively improve your prompt to reach the desired output.
* The confidence of a chatbot does not indicate if its responses are correct. They may also agree with you when you are wrong.
* Chatbots may produce inaccurate, out-of-date, incomplete, or unnecessarily complicated information. Always evaluate their responses critically, test and simplify generated code, and validate information using reliable sources.
* Asking a chatbot the same question more than once (even with the same prompt!) can result in different answers, so be sure to document what you can for the sake of reproducibility.
* Keep track of the models you use (including versions) and be transparent about AI use in your work.
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
