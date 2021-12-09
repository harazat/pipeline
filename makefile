
# choose one of the following to compile
all:
			as -o makewords makewords.s
#			as -o lowercase lowercase.s
#			as -o armscii2utf armscii2utf.s


test_lowercase:
			echo "AaBbccDDoOo" | ./lowercase
			cat text_to_spell | ./fmt -1 | ./lowercase | sort | tr '.' ' ' | uniq |  comm -23 - dictionary

test_makewords:
			echo "aaa aab, aac." | ./makewords
			cat text_to_spell | ./makewords | tr A-Z a-z | sort | tr '.' ' ' | uniq |  comm -23 - dictionary

test_armscii2utf:
			cat armscii | ./armscii2utf


