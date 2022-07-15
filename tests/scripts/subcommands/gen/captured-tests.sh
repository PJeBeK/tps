# Do not edit this file manually. It is automatically generated.
# Edit 'capture-all.sh' instead.

source ../../definition_get_head.sh
source ../../definition_not_web_terminal.sh
source definitions.sh


stage_dir_with_scripts stage1

expect_exec -f "tests" "captured-data/k-0/probed_files/0_tests" -o "captured-data/k-0/stdout" -eempty tgen
expect_exec -o "captured-data/k-1/stdout" -eempty tgen -s
expect_exec -o "captured-data/k-2/stdout" -eempty tgen -w
expect_exec -o "captured-data/k-3/stdout" -eempty tgen --no-val
expect_exec -o "captured-data/k-4/stdout" -eempty tgen --no-sol-compile
expect_exec -f "tests" "captured-data/k-5/probed_files/0_tests" -o "captured-data/k-5/stdout" -eempty tgen -u --no-gen
expect_exec -f "tests" "captured-data/k-6/probed_files/0_tests" -o "captured-data/k-6/stdout" -eempty tgen --no-sol
expect_exec -o "captured-data/k-7/stdout" -eempty tgen -u --no-gen --no-val
expect_exec -o "captured-data/k-8/stdout" -eempty tgen -u --no-gen --no-sol
expect_exec -o "captured-data/k-9/stdout" -eempty tgen --no-val --no-sol
expect_exec -o "captured-data/k-10/stdout" -eempty tgen -u --no-gen --no-val --no-sol

expect_exec -oempty -eh "Error: tests directory 'new-test-dir' does not exist (needed due to flag '--no-gen')." -r 3 tgen --tests-dir=new-test-dir --no-gen
expect_exec -oempty -eh "Error: tests directory 'new-test-dir' does not exist (needed due to flag '-u')." -r 3 tgen --tests-dir=new-test-dir -u

run_in_stage rm -f gen/gen1.cpp
expect_exec -o "captured-data/k-13/stdout" -eempty tgen
expect_exec -o "captured-data/k-14/stdout" -eempty get_head 8 8 tgen -s

run_in_stage cp extra/gen-ce.cpp gen/gen1.cpp
expect_exec -oh "generator           compile[FAIL]" -eempty get_head 1 1 tgen

run_in_stage cp extra/gen-warn.cpp gen/gen1.cpp
expect_exec -o "captured-data/k-16/stdout" -eempty tgen
expect_exec -oh3 "generator           compile[WARN]" "exit-code: 0" "warnings:" -eempty get_head 3 3 tgen -w

run_in_stage cp extra/gen-rte.cpp gen/gen1.cpp
expect_exec -o "captured-data/k-18/stdout" -eempty tgen
expect_exec -o "captured-data/k-19/stdout" -eempty -r 20 tgen -s
expect_exec -o "captured-data/k-20/stdout" -eempty tgen --no-val
expect_exec -o "captured-data/k-21/stdout" -eempty tgen --no-sol

run_in_stage rm -f gen/manual/example-01.in
expect_exec -o "captured-data/k-22/stdout" -eempty tgen
expect_exec -o "captured-data/k-23/stdout" -eempty -r 20 tgen -s


stage_dir_with_scripts stage1

run_in_stage get_head 0 0 tgen
run_in_stage rm -f tests/0-01.in
expect_exec -o "captured-data/k-24/stdout" -eempty tgen -u --no-gen --no-val --no-sol
expect_exec -o "captured-data/k-25/stdout" -eempty tgen -u --no-gen --no-val --no-sol -s
expect_exec -o "captured-data/k-26/stdout" -eempty tgen -u --no-gen --no-val
expect_exec -o "captured-data/k-27/stdout" -eempty -r 4 tgen -u --no-gen --no-val -s
expect_exec -o "captured-data/k-28/stdout" -eempty tgen -u --no-gen --no-sol
expect_exec -o "captured-data/k-29/stdout" -eempty -r 4 tgen -u --no-gen --no-sol -s
expect_exec -o "captured-data/k-30/stdout" -eempty tgen -u --no-gen
expect_exec -o "captured-data/k-31/stdout" -eempty -r 4 tgen -u --no-gen -s


stage_dir_with_scripts stage1

run_in_stage rm -f validator/validator.cpp
expect_exec -o "captured-data/k-32/stdout" -eempty tgen
expect_exec -o "captured-data/k-33/stdout" -eempty get_head 6 6 tgen -s

run_in_stage cp extra/validator-ce.cpp validator/validator.cpp
expect_exec -oh2 "generator           compile[OK]" "validator           compile[FAIL]" -eempty get_head 2 2 tgen

run_in_stage cp extra/validator-warn.cpp validator/validator.cpp
expect_exec -o "captured-data/k-35/stdout" -eempty tgen
expect_exec -oh4 "generator           compile[OK]" "validator           compile[WARN]" "exit-code: 0" "warnings:" -eempty get_head 4 4 tgen -w

run_in_stage cp extra/validator-rte.cpp validator/validator.cpp
expect_exec -o "captured-data/k-37/stdout" -eempty tgen
expect_exec -o "captured-data/k-38/stdout" -eempty get_head 8 8 tgen -s


stage_dir_with_scripts stage1

run_in_stage rm -f solution/correct1.cpp
expect_exec -oempty -eh "Solution file 'correct1.cpp' not found." get_head 1 1 tgen
expect_exec -f "tests" "captured-data/k-40/probed_files/0_tests" -o "captured-data/k-40/stdout" -eempty tgen --no-sol

run_in_stage cp extra/sol-ce.cpp solution/correct1.cpp
expect_exec -oh3 "generator           compile[OK]" "validator           compile[OK]" "solution            compile[FAIL]" -eempty get_head 3 3 tgen
expect_exec -o "captured-data/k-42/stdout" -eempty tgen --no-sol-compile
expect_exec -o "captured-data/k-43/stdout" -eempty get_head 6 6 tgen --no-sol-compile -s

run_in_stage cp extra/sol-warn.cpp solution/correct1.cpp
expect_exec -o "captured-data/k-44/stdout" -eempty tgen
expect_exec -o "captured-data/k-45/stdout" -eempty get_head 5 5 tgen -w

run_in_stage cp extra/sol-rte.cpp solution/correct1.cpp
expect_exec -o "captured-data/k-46/stdout" -eempty tgen
expect_exec -o "captured-data/k-47/stdout" -eempty get_head 8 8 tgen -s


stage_dir_with_scripts stage1

run_in_stage cp extra/data-no-args gen/data
expect_exec -o "captured-data/k-48/stdout" -eempty tgen
expect_exec -o "captured-data/k-49/stdout" -eempty -r 1 tgen -s

run_in_stage cp extra/data-two-args gen/data
expect_exec -o "captured-data/k-50/stdout" -eempty tgen
expect_exec -o "captured-data/k-51/stdout" -eempty -r 1 tgen -s

run_in_stage cp extra/data-bad-arg gen/data
expect_exec -o "captured-data/k-52/stdout" -eempty tgen
expect_exec -o "captured-data/k-53/stdout" -eempty -r 4 tgen -s

run_in_stage cp extra/data-bad-cmd gen/data
expect_exec -o "captured-data/k-54/stdout" -eempty tgen
expect_exec -o "captured-data/k-55/stdout" -eempty get_head 10 10 tgen -s
