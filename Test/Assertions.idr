-- ---------------------------------------------------------- [ Assertions.idr ]
-- Module    : Assertions.idr
-- Copyright : (c) Jan de Muijnck-Hughes
-- License   : see LICENSE
-- --------------------------------------------------------------------- [ EOH ]
module Test.Assertions

import public Test.Utils

import Test.Generic

%access public

assertTrue : Bool -> IO ()
assertTrue b = genericTest (Just "Assert True") b True (==)

assertFalse : Bool -> IO ()
assertFalse b = genericTest (Just "Assert False") b False (==)

assertEquals : (Eq a, Show a) => (given : a) -> (expected : a) -> IO ()
assertEquals g e = genericTest (Just "Assert Equals") g e (==)

assertNotEquals : (Eq a, Show a) => (given : a) -> (expected : a) -> IO ()
assertNotEquals g e = genericTest (Just "Assert Not Equals") g e (\x,y => not (x == y))

assertJust : Show a => Maybe a -> IO ()
assertJust g = genericTest (Just "Assert Is Just") (isJust g) True (==)

assertNothing : Show a => Maybe a -> IO ()
assertNothing g = genericTest (Just "Assert Is Nothing") (isNothing g) True (==)

assertLeft : (Show a, Show b) => Either a b -> IO ()
assertLeft g = genericTest (Just "Assert is Left") (isLeft g) True (==)

assertRight : (Show a, Show b) => Either a b -> IO ()
assertRight g = genericTest (Just "Assert is Right") (isRight g) True (==)

-- --------------------------------------------------------------------- [ EOF ]
