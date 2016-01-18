#ifndef _TRY_THROW_CATCH_H_
#define _TRY_THROW_CATCH_H_

/*
1: case x; 本质上相当于编译生成一个跳转label.对应着一个虚拟内存地址，不一定非要和 switch搭配。

2: THROW( BAR_EXCEPTION ); 本质上相当于 longjmp(jmp_buf, BAR_EXCEPTION );

longjmp(jmp_buf, x); 本质上相当于goto case(x); 跳转到case x;这个标签

3: try catch 这套机制的本质，相当于 goto 语句的封装。
因为现在一般不用goto语句，但是对于出错处理, goto语句使用起来又很方便，最高效。
因此封装了goto这套方法，使用在特定的场景。成了所谓的try throw catch机制。

*/

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
            /*break;*/  /* dead loop  */

            /*CATCH( BAR_EXCEPTION )*/
            case 2:
            {
                    printf("Got Bar!\n");
                    longjmp(ex_buf__, 1);
                    printf("I do not appear 2\n");
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

        return 0;
}

