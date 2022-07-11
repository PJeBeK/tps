set -euo pipefail

pushd_test_context_here
begin_capturing

echo

capture_run source "../../definitions.sh"
capture_run source "../definitions.sh"
capture_run source "definitions.sh"

echo
capture_run _TT_check_stage_not_in_a_tps_repo

capture_exec_key_counter=0
function capture_exec_k {
	echo
	capture_run stage_dir "stage"
	capture_exec "k-$((capture_exec_key_counter++))" "$@"
}

echo
capture_exec_k -fc "output_dir" run_ttis "templates_dir/template1/task-template-instantiate.sh" -T "templates_dir" -t "template1" "output_dir" "$@"

function capture_replace {
	local -r replace_cmd_and_args="$1"; shift
	local -r replaced_value="REPL"

	capture_exec_k -fc "output_dir" run_replace_func 'template2' "prompt string ${replace_varname}" "${replace_cmd_and_args}" -- -D "${replace_varname}=${replaced_value}"
}

echo
replace_varname="myvar"

capture_replace 'py_regex_replace'
capture_replace 'py_regex_replace "str1"'
capture_replace 'py_regex_replace "str1" "${myvar}" "non-exist"'
capture_replace 'py_regex_replace "str1" "${myvar}" "a_dir"'

echo
capture_replace 'py_regex_replace "str1" "${myvar}"'
capture_replace 'py_regex_replace "str1" "${myvar}" "boo.sh"'
capture_replace 'py_regex_replace "str1" "${myvar}" ".foo.sh"'
capture_replace 'py_regex_replace "str1" "${myvar}" "boo.sh" ".foo.sh"'
capture_replace 'py_regex_replace "str1" "${myvar}" "a_dir/boo.sh"'

end_capturing
popd_test_context
