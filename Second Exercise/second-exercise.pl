proceed_list(List, List).
proceed_list([_|Tail], List) :- proceed_list(Tail, List).

