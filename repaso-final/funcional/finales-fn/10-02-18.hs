-- https://docs.google.com/document/d/1qmirq60MyHMfwbwwa64pSaD9YwN-7pJOJJuM_u1pDps/edit

f h p = any (<h). map p . snd

--1
f :: (Ord a) => a -> (b -> a) -> (c, [b]) -> Bool

--2
funcion barrera transformacion =
  any (<barrera). map transformacion . snd

-- funcion 10 (\x -> x * 2) ("Juan", [1..]) --termina

-- funcion 10 (\x -> x * 2) ("Juan", [11..]) -- no termina