%% Based on canonical data version 1.3.0
%% https://github.com/exercism/problem-specifications/raw/master/exercises/nucleotide-count/canonical-data.json
%% This file is automatically generated from the exercises canonical data.

-module(nucleotide_count_tests).

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").




'1_empty_strand_test'() ->
    Strand = [],
    ?assertEqual(lists:sort([{"A", 0}, {"C", 0}, {"G", 0},
			     {"T", 0}]),
		 lists:sort(nucleotide_count:nucleotide_counts(Strand))),
    ?assertEqual(0, nucleotide_count:count(Strand, "A")),
    ?assertEqual(0, nucleotide_count:count(Strand, "C")),
    ?assertEqual(0, nucleotide_count:count(Strand, "G")),
    ?assertEqual(0, nucleotide_count:count(Strand, "T")).

'2_can_count_one_nucleotide_in_single_character_input_test'() ->
    Strand = "G",
    ?assertEqual(lists:sort([{"A", 0}, {"C", 0}, {"G", 1},
			     {"T", 0}]),
		 lists:sort(nucleotide_count:nucleotide_counts(Strand))),
    ?assertEqual(0, nucleotide_count:count(Strand, "A")),
    ?assertEqual(0, nucleotide_count:count(Strand, "C")),
    ?assertEqual(1, nucleotide_count:count(Strand, "G")),
    ?assertEqual(0, nucleotide_count:count(Strand, "T")).

'3_strand_with_repeated_nucleotide_test'() ->
    Strand = "GGGGGGG",
    ?assertEqual(lists:sort([{"A", 0}, {"C", 0}, {"G", 7},
			     {"T", 0}]),
		 lists:sort(nucleotide_count:nucleotide_counts(Strand))),
    ?assertEqual(0, nucleotide_count:count(Strand, "A")),
    ?assertEqual(0, nucleotide_count:count(Strand, "C")),
    ?assertEqual(7, nucleotide_count:count(Strand, "G")),
    ?assertEqual(0, nucleotide_count:count(Strand, "T")).

'4_strand_with_multiple_nucleotides_test'() ->
    Strand = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGAT"
	     "TAAAAAAAGAGTGTCTGATAGCAGC",
    ?assertEqual(lists:sort([{"A", 20}, {"C", 12},
			     {"G", 17}, {"T", 21}]),
		 lists:sort(nucleotide_count:nucleotide_counts(Strand))),
    ?assertEqual(20, nucleotide_count:count(Strand, "A")),
    ?assertEqual(12, nucleotide_count:count(Strand, "C")),
    ?assertEqual(17, nucleotide_count:count(Strand, "G")),
    ?assertEqual(21, nucleotide_count:count(Strand, "T")).

'5_strand_with_invalid_nucleotides_test'() ->
    Strand = "AGXXACT",
    ?assertError(_,
		 nucleotide_count:nucleotide_counts(Strand)),
    ?assertError(_, nucleotide_count:count(Strand, "A")),
    ?assertError(_, nucleotide_count:count(Strand, "C")),
    ?assertError(_, nucleotide_count:count(Strand, "G")),
    ?assertError(_, nucleotide_count:count(Strand, "T")).
