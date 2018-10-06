{-# LANGUAGE OverloadedStrings #-}

module Types where

import qualified Data.Text.Lazy as TL
import Data.Aeson

-- | Types for use in the API

-- User stuff
data UserData =
  UserData { _usrName :: TL.Text
           , _usrPassword :: TL.Text } deriving (Eq, Show)

instance FromJSON UserData where
  parseJSON = withObject "user-data" $ \v -> UserData
    <$> v .: "username"
    <*> v .: "password"

instance ToJSON UserData where
  toJSON x = object ["username" .= _usrName x
                    ,"password" .= _usrPassword x]

data User =
  User { _usrInfo :: UserData
       , _createdBoards :: [ProjectDetails]
       , _assignedBoards :: [ProjectDetails] } deriving (Eq, Show)

instance FromJSON User where
  parseJSON = withObject "user" $ \v -> User
    <$> v .: "user-info"
    <*> v .: "authored-projects"
    <*> v .: "assigned-boards"

instance ToJSON User where
  toJSON u = object [ "user-info" .= _usrInfo u
                    , "authored-projects" .= _createdBoards u
                    , "assigned-boards" .= _assignedBoards u ]

-- Project stuff
data ProjectDetails =
  ProjectDetails { _projId :: Int
                 , _projName :: TL.Text
                 , _projDesc :: TL.Text
                 , _projScore :: Int
                 , _projAuthor :: User } deriving (Eq, Show)

instance ToJSON ProjectDetails where
  toJSON p = object [ "id" .= _projId p
                    , "name" .= _projName p
                    , "desc" .= _projDesc p
                    , "score" .= _projScore p
                    , "author" .= _projAuthor p]

instance FromJSON ProjectDetails where
  parseJSON = withObject "project-details" $ \v -> ProjectDetails
    <$> v .: "id"
    <*> v .: "name"
    <*> v .: "desc"
    <*> v .: "score"
    <*> v .: "author"

data ActiveProject =
  ActiveProject { _info :: ProjectDetails
                , _members :: [UserData] } deriving (Eq, Show)  

instance FromJSON ActiveProject where
  parseJSON = withObject "active-project" $ \v -> ActiveProject
    <$> v .: "info"
    <*> v .: "members"

instance ToJSON ActiveProject where
  toJSON ap = object [ "info" .= _info ap
                     , "members" .= _members ap ]

data Board =
  Board { _activeProject :: ActiveProject
        , _projectList :: [ProjectDetails] } deriving (Eq, Show)

instance FromJSON Board where
  parseJSON = withObject "board" $ \v -> Board
    <$> v .: "active-project"
    <*> v .: "project-list"

instance ToJSON Board where
  toJSON b = object [ "active-project" .= _activeProject b
                    , "project-list" .= _projectList b ]
