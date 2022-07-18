etapa2: 
	flex scanner.l
	bison -d -v --report-file=out.txt parser.y
	gcc lex.yy.c parser.tab.c main.c -o etapa2

clean:
	rm -rf etapa2 flex.yy.c parser.tab.c parser.tab.h out.txt
