{-# OPTIONS_GHC -ddump-parsed-ast -ddump-to-file #-}
{-# OPTIONS_GHC -Wno-missing-signatures #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE UnboxedSums #-}
{-# LANGUAGE TypeAbstractions #-}
{-# LANGUAGE NPlusKPatterns #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE RequiredTypeArguments #-}
{-# LANGUAGE ExplicitNamespaces #-}
module Language.Haskell.Syntax.Pat.Example where

wildPat _ {- WildPat -} = ()
varPat x {- VarPat -} = x
lazyPat ~x {- LazyPat -} = x
asPat x@y {- AsPat -} = (x,y)
parPat (x) {- ParPat -} = x
bangPat !x {- BangPat -} = x
listPat [x, y] {- ListPat -} = (x, y)
tuplePat (x, y) {- TuplePat -} = (x, y)
tuplePatUnit () {- TuplePat -}  = ()
-- Requires -XUnboxedTuples
tuplePatUnboxed (# x, y #) {- TuplePat -} = (x, y)
-- Requires -XUnboxedSums
sumPat (# x  | | #) {- SumPat -} = x
conPat (ConPatDemo x y) {- ConPat -}= (x, y)
conPatRecord (ConPatRecord {conPatRecordX = x, conPatRecordY = y}) {- ConPat -} = (x, y)
-- Requires -XViewPatterns
viewPat (id -> x) {- ViewPat -}= x
-- Requires -XTemplateHaskell
splicePat $( [p| x |] ) {- SplicePat -} = x
litPat 'x' {- LitPat -} = 'x'
nPat 42 {- NPat -} = ()
nPat3 (-42) {- NPat -} = ()
-- Requires -XNPlusKPatterns
nPlusKPat (k+1) {- NPlusKPat -} = k
sigPat (x :: Int) {- SigPat -} = x
-- Requires -XTypeAbstractions
invisPat :: forall a. a -> a
invisPat @t {- InvisPat -} x = x :: t

-- Requires -XRequiredTypeArguments -XExplicitNamespaces
embTyPat :: forall t -> t -> t
embTyPat (type t) {- EmbTyPat -} a = a :: t

-- Helpers
data ConPatDemo = ConPatDemo Int Bool
data ConPatRecord = ConPatRecord { conPatRecordX :: Int, conPatRecordY :: Bool }
