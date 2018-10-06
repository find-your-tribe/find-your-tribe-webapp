module Types where

import qualified Data.Text.Lazy as TL

-- | Types for use in the API

-- User stuff
data UserData =
  UserData { _usrName :: TL.Text
           , _usrPassword :: TL.Text } deriving (Eq, Show)

data User =
  User { _usrInfo :: UserData
       , _createdBoards :: [Board]
       , _assignedBoards :: [Board] } deriving (Eq, Show)

-- Project stuff
data ProjectDetails =
  ProjectDetails { _projName :: TL.Text
                 , _projDesc :: TL.Text
                 , _projCreator :: User } deriving (Eq, Show)

data ActiveProject =
  ActiveProject { _projDetails :: ProjectDetails
                , _projMembers :: [User] } deriving (Eq, Show)

data Board =
  Board { _activeProject :: ActiveProject
        , _projectList :: [ProjectDetails] } deriving (Eq, Show)
