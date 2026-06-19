/* func_ov002_022858a4: snapshot the two 100-byte player record halves into the
 * cf19c / cfa04 backups. */
#include "ov002_core.h"
extern char data_ov002_022cf0bc[];
extern char data_ov002_022cf924[];
extern void func_ov002_0229cc60(void *dst, void *src, int n);
void func_ov002_022858a4(void *arg0) {
    func_ov002_0229cc60(data_ov002_022cf0bc, arg0, 100);
    func_ov002_0229cc60(data_ov002_022cf924, (char *)arg0 + 100, 100);
}
