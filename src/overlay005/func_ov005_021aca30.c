#include "ov005_core.h"
void func_ov005_021aca30(int *o, int v) {
    if (o[21]) return;          /* +84 */
    if (o[13] < 16) return;     /* +52 */
    o[19] = v;   /* +76 */
    o[20] = v;   /* +80 */
    o[21] = 1;   /* +84 */
    o[22] = o[13];  /* +88 = +52 */
}
