/* func_02052f88: guarded long-long forward. If func_02053688(a0) != 2 return 0;
 * else return func_0205370c(a0) (both r0:r1). */
extern int func_02053688(int);
extern long long func_0205370c(int);
long long func_02052f88(int a0){
    if (func_02053688(a0) != 2) return 0;
    return func_0205370c(a0);
}
