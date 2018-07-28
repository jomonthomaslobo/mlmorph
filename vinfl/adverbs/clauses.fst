#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]
%%%% Adverb clauses %%%%%%%%%%
% Adverb clauses will be taken as those subordinate clauses whose function in
% relation to a main clause is roughly analogous to that of an adverb in a simple
% sentence.


$past-tense$ = "<../past.a>"

% Relative participle + time marker
% Relative participle forms (or, for those who do not accept this analysis, forms
% that have the same phonological shape as RPs) are used along with a range of
% bound and free forms to express temporal relationships between main and
% subsidiary clause. All three tense forms occur, but no more than two of the set
% with a given conjunction.


% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has <adv-clause-rp-past> at end.
$fake-past$ = <RB>:<past> ^-> ([#verbs#]+ __ [<adv-clause-rp-past>])
$remove-past$ = <past>:<RB> ^-> ([#verbs#]+ __ [<adv-clause-rp-past>])

% Examples: വന്ന, പറഞ്ഞ, പോയ, പഠിച്ച
$verb-suffix-map$ = {ു}:{} | {ി} : {ിയ}

$adv-clause-rp-past-form$ = $verb-suffix-map$ ^-> ([#Consonants#]+ __ [#BM##TMP##verbs#<past>]+ <adv-clause-rp-past> )
$adv-clause-rp-past$ = $fake-past$ || $past-tense$ || $adv-clause-rp-past-form$ || $remove-past$

% Relative participle - present
% പറയുന്ന, വരുന്ന, ഓടുന്ന, ചാടുന്ന, പഠിക്കുന്ന
$adv-clause-rp-present$ = ( {ുക}:{ുന്ന} | {ിക}:{ുന്ന} ) <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <adv-clause-rp-present>)

$adv-clauses$ = $adv-clause-rp-past$ || $adv-clause-rp-present$

$adv-clauses$
