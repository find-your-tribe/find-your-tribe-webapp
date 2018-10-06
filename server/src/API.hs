{-# LANGUAGE DataKinds, TypeOperators #-}

module API where

-- | API for the web app

import Types
import Servant

import qualified Data.Text.Lazy as TL

type MainAPI = ProjectAPI :<|> UserAPI :<|> Get '[JSON] TL.Text

type ProjectAPI = "project" :> Capture "project-name" TL.Text :> Get '[JSON] ProjectDetails
type UserAPI = "user" :>
               (
                 "new" :> Post '[JSON] UserData
                 :<|> "user" :> Capture "user-name" :> Get '[JSON]
               )

-- API implementations
mainAPI :: Proxy MainAPI
mainAPI = Proxy

projectAPI :: Proxy ProjectAPI
projectAPI = Proxy

userAPI :: Proxy UserAPI
userAPI = Proxy
