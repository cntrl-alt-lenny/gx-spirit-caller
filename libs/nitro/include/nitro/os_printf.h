/*
 * nitro/os_printf.h — OS_printf string-builder context struct.
 *
 * Brief 072 (D5 struct vendoring). Pokediamond defines `printfStr`
 * inline in `arm9/lib/NitroSDK/src/OS_printf.c` (not in any
 * header). Brief 071 wave 2's compile-error survey included ports
 * that called into the string-builder helpers (`string_put_char`,
 * `string_fill_char`, `string_put_string`) and needed the struct
 * body for member access on `dest->stringEnd`, `dest->spaceLeft`,
 * etc.
 *
 * Vendored verbatim from pokediamond. Field order is load-bearing:
 * the string-builder helpers in the corresponding `.c` ports
 * access fields by struct offset.
 */

#ifndef NITRO_OS_PRINTF_H_
#define NITRO_OS_PRINTF_H_

#include <nitro/types.h>

#ifdef __cplusplus
extern "C" {
#endif


/* printfStr — running state for the OS_printf string-builder
 * helpers. `spaceLeft` tracks remaining buffer capacity;
 * `stringEnd` is the write cursor; `stringStart` is the buffer
 * base. */
typedef struct printfStr {
    s32  spaceLeft;
    s8  *stringEnd;
    s8  *stringStart;
} printfStr;


#ifdef __cplusplus
}
#endif

#endif /* NITRO_OS_PRINTF_H_ */
