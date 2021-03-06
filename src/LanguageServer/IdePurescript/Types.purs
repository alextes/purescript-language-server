module LanguageServer.IdePurescript.Types where

import Prelude

import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import Effect.Aff (Aff)
import Foreign (Foreign)
import Foreign.Object (Object)
import IdePurescript.Modules (State)
import LanguageServer.Types (Connection, DocumentStore, DocumentUri, Settings)
import PscIde.Command (RebuildError)

newtype ServerState = ServerState
  { port :: Maybe Int
  , deactivate :: Aff Unit
  , root :: Maybe String
  , conn :: Maybe Connection
  , modules :: State
  , modulesFile :: Maybe DocumentUri
  , diagnostics :: Object (Array RebuildError)
  }

derive instance newtypeServerState :: Newtype ServerState _

type CommandHandler a = DocumentStore -> Settings -> ServerState -> Array Foreign -> Aff a

