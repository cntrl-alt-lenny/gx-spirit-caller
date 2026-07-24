/* game/types.h — shared game type home.
 *
 * Keep proven primitive names available to game headers while
 * game-specific structs are recovered into this single include layer.
 *
 * Deliberately does NOT `#include <nitro/types.h>`: that header defines
 * u32 as `unsigned long`, but every existing ovNNN_core.h (000/002/006)
 * independently typedefs u32 as `unsigned int` — same width on this ARM32
 * target, but a distinct C type, so mwcc throws a hard redefinition error
 * the moment a TU sees both. Matches the project's own dominant
 * convention here instead, so this header composes with any existing
 * ovNNN_core.h without a clash.
 */
#ifndef GAME_TYPES_H_
#define GAME_TYPES_H_

typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

/* Game structs are added here once their layout is proven from a matched TU. */

#endif /* GAME_TYPES_H_ */
