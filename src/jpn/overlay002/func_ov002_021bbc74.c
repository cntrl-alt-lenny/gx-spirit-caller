/* func_ov002_021bbc74: count i in [0,10] where pred1(arg0,i,arg2)!=0 AND
 * pred2(arg0,i)==0. */

extern int func_ov002_021ba024(int a, int b, int c);
extern int func_ov002_021bd630(int a, int b);

int func_ov002_021bbc74(int arg0, int arg2)
{
    int i;
    int count = 0;
    for (i = 0; i <= 10; i++) {
        if (func_ov002_021ba024(arg0, i, arg2) != 0) {
            if (func_ov002_021bd630(arg0, i) == 0)
                count++;
        }
    }
    return count;
}
