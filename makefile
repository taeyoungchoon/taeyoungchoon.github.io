all: foo

foo: foo.c
	gcc foo.c -o foo

clean:
	rm *~ *.tex *.fas *.aux *.lib *.log
