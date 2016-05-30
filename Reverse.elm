import Html exposing (Html, Attribute, div, input, text, button)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import String

main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL


type alias Model =
  { content: String
  }

model : Model
model =
  { content = "" }



-- UPDATE


type Msg
  = Change String
  | Clear

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }
    Clear ->
      { model | content = "" }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to reverse", onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
    , button [ onClick Clear ] [ text "CLEAR" ]
    ]
