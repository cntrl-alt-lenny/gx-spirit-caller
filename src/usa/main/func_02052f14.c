/* func_02052f14: guarded long-long forward. If func_02053614(a0) != 2 return 0;
 * else return func_02053698(a0) (both r0:r1). */
extern int func_02053614(int);
extern long long func_02053698(int);
long long func_02052f14(int a0){
    if (func_02053614(a0) != 2) return 0;
    return func_02053698(a0);
}
