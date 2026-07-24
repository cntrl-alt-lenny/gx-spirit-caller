/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_printf.c
 *   function: string_put_char
 *   target:   string_put_char (0x0209164c, size 0x2c)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */


#include <nitro/os_printf.h>
#include <nitro/types.h>
void string_put_char(struct printfStr *dest, s8 value)
{
    if (dest->spaceLeft != 0)
    {
        dest->stringEnd[0] = value;
        dest->spaceLeft--;
    }
    dest->stringEnd++;
}
