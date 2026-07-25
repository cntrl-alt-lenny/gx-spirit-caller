/* game/types.h — shared game type home.
 *
 * Keep proven primitive names available to game headers while
 * game-specific structs are recovered into this single include layer.
 *
 * Deliberately does NOT `#include <nitro/types.h>`: that header defines
 * u32 as `unsigned long` and s32 as `signed long`, but every existing
 * ovNNN_core.h (000/002/006) independently typedefs u32 as
 * `unsigned int`, and multiple matched TUs (src/main/
 * SysWork_GetPointDistance.c, src/overlay002/func_ov002_0226ad5c.c)
 * independently typedef s32 as `signed int` — same width as `long` on
 * this ARM32 target, but a distinct C type, so mwcc throws a hard
 * redefinition error the moment a TU sees both spellings. Matches the
 * project's own dominant convention here instead (int, not long), so
 * this header composes with any existing ovNNN_core.h or matched TU's
 * own local typedef without a clash.
 *
 * s8, fx32, and BOOL have no competing project-local spelling (grepped
 * project-wide before adding), so they match nitro/types.h exactly.
 */
#ifndef GAME_TYPES_H_
#define GAME_TYPES_H_

typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;
typedef signed char    s8;
typedef signed int     s32;
typedef s32            fx32;
typedef int            BOOL;

/* Game structs are added here once their layout is proven from a matched TU. */

#endif /* GAME_TYPES_H_ */
