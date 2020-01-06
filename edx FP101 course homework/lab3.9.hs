-- The following two applications execute well both, so the right answer to exercise is unlear.
((head .) tail) $ [1, 2, 3, 4]
(head .) (tail $) [1, 2, 3, 4]


-- Here the nice example that removes ambiguity:
((map negate) [1, 2, 3, 4]) : []
