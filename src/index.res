@val external document: {..} = "document"
@val external window: {..} = "window"

// font size variants
type fontSizes =
  | Small
  | Medium
  | Large

// tailwindclass corresponding to each font size variant
let className = font =>
  switch font {
  | Small => "text-sm"
  | Medium => "text-2xl"
  | Large => "text-6xl"
  }

// update preview text
let updatePreviewText = event => {
  let textView = document["getElementById"]("textView")
  textView["innerText"] = event["target"]["value"]
}

// change font size of an element
let updateFontOf = (element, font) => {
  element["classList"]["remove"](className(Small), className(Medium), className(Large))
  element["classList"]["add"](className(font))
}

// update font size with radio btns
let updatePreviewFont = event => {
  let textView = document["getElementById"]("textView")
  let updateFontTo = updateFontOf(textView)

  switch event["target"]["id"] {
  | "selectSmall" => updateFontTo(Small)
  | "selectRegular" => updateFontTo(Medium)
  | _ => updateFontTo(Large)
  }
}

let textEditor = document["getElementById"]("textEditor")
textEditor["addEventListener"]("input", updatePreviewText)

let radioBtn = document["getElementById"]("radio-text-size")
radioBtn["addEventListener"]("change", updatePreviewFont)
