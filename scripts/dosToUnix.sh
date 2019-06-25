#!/bin/sh
for file in **/*.cpp; do
	nvim $file -c "set ff=unix" -c ":wq"
done
for file in **/*.h; do
	nvim $file -c "set ff=unix" -c ":wq"
done
for file in **/*.hpp; do
	nvim $file -c "set ff=unix" -c ":wq"
done
