/*
 * runtime/intrinsics.h — CodeWarrior compiler intrinsics used by game code.
 *
 * `__memcpy` is mwcc's built-in copy: for a small constant size the compiler
 * expands it inline (byte or word loads and stores), so it never appears as a
 * call or a symbol in the retail binary. Game code that copies a few bytes
 * through it matches the original only when written this way.
 */

#ifndef RUNTIME_INTRINSICS_H_
#define RUNTIME_INTRINSICS_H_

#ifdef __cplusplus
extern "C" {
#endif

void *__memcpy(void *dst, const void *src, unsigned long n);

#ifdef __cplusplus
}
#endif

#endif /* RUNTIME_INTRINSICS_H_ */
