/* AutoloadCallback: NDS autoload hook, ARM-mode.
 *
 *     bx lr
 *
 * The NDS autoload system calls this once per overlay as it's
 * dynamically loaded in. The retail binary's body is exactly one
 * `bx lr` — 4 bytes, preserving the hook point for games that
 * need to patch overlay loads without modifying the loader itself.
 *
 * Already declared in libs/runtime/include/runtime/runtime.h.
 */

void AutoloadCallback(void) {
}
