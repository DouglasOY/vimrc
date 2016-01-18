#ifndef _TRY_THROW_CATCH_H_
#define _TRY_THROW_CATCH_H_

#include <stdio.h>
#include <setjmp.h>

#define TRY do { jmp_buf ex_buf__; switch( setjmp(ex_buf__) ) { case 0: while(1) {
#define CATCH(x) break; case x:
#define FINALLY break; } default: {
#define ETRY break; } } }while(0)
#define THROW(x) longjmp(ex_buf__, x)

#endif /*!_TRY_THROW_CATCH_H_*/

#define FOO_EXCEPTION (1)
#define BAR_EXCEPTION (2)
#define BAZ_EXCEPTION (3)

int
main(int argc, char** argv)
{
        /*TRY*/
        jmp_buf ex_buf__;
        switch ( setjmp(ex_buf__) )
        {
        case 0:
                while (1)
                {
                        {
                                printf("In Try Statement\n");
                                /*THROW( BAR_EXCEPTION );*/
                                longjmp(ex_buf__, 2);
                                printf("I do not appear\n");
                        }
                        break;

                        /*CATCH( FOO_EXCEPTION )*/
                        case 1:
                        {
                                printf("Got Foo!\n");
                        }
                        break;

                        /*CATCH( BAR_EXCEPTION )*/
                        case 2:
                        {
                                printf("Got Bar!\n");
                        }
                        break;

                        /*CATCH( BAZ_EXCEPTION )*/
                        case 3:
                        {
                                printf("Got Baz!\n");
                        }
                        break;

                        /*ETRY;*/
                }
        }

        return 0;
}


