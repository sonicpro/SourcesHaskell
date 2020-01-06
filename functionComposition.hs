-- In the following call we use $ operator to lower 'filter even' function priority from 10 to 0,
-- and therefore make it possible to compose three functions namely 'take', 'reverse', and 'filter even'
-- into one function before application of it to a list.


-- This won't compile:
-- f = take 3 . reverse . filter even [1..10]

-- This compiles successfully:
f' = take 3 . reverse . filter even $ [1..10]
