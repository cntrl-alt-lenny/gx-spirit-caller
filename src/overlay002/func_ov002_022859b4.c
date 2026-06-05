/* func_ov002_022859b4: snapshot the two 100-byte player record halves into the
 * cf19c / cfa04 backups. */
#include "ov002_core.h"
extern char data_ov002_022cf19c[];
extern char data_ov002_022cfa04[];
extern void func_ov002_0229cd70(void *dst, void *src, int n);
void func_ov002_022859b4(void *arg0) {
    func_ov002_0229cd70(data_ov002_022cf19c, arg0, 100);
    func_ov002_0229cd70(data_ov002_022cfa04, (char *)arg0 + 100, 100);
}
