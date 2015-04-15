PREFIX?=	/usr/local

CC?=		gcc
CFLAGS?=	# empty
CFLAGS+=	-DHAS_NCURSES -DHAS_UNISTD -DHAS_STDARG -DHAS_STDLIB -DHAS_SYS_WAIT
#CFLAGS+=	-Wall -Wextra -pedantic
CFLAGS+=	-w

LIBS=		-lncursesw

PROG=		ee

all: ${PROG}

${PROG}: ${PROG}.c
	${CC} ${CFLAGS} ${PROG}.c ${LIBS} -o ${PROG}

install: ${PROG}
	cp ${PROG} ${DESTDIR}${PREFIX}/bin/
	cp ${PROG}.1 ${DESTDIR}${PREFIX}/man/man1/

clean :
	rm -f ${PROG}
