; func_0201d530 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208dd9c
        .extern func_0208ddec
        .extern func_0208de4c
        .extern func_0208de94
        .extern func_0208deec
        .extern func_0208df0c
        .extern func_0208df40
        .extern func_0208df60
        .global func_0201d530
        .arm
func_0201d530:
    stmdb sp!, {r3, lr}
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_190
    b .L_140
    b .L_148
    b .L_150
    b .L_158
    b .L_160
    b .L_168
    b .L_170
    b .L_178
    b .L_180
    b .L_188
.L_140:
    bl func_0208df60
    ldmia sp!, {r3, pc}
.L_148:
    bl func_0208df0c
    ldmia sp!, {r3, pc}
.L_150:
    bl func_0208de94
    ldmia sp!, {r3, pc}
.L_158:
    bl func_0208ddec
    ldmia sp!, {r3, pc}
.L_160:
    mov r0, #0x6400000
    ldmia sp!, {r3, pc}
.L_168:
    bl func_0208df40
    ldmia sp!, {r3, pc}
.L_170:
    bl func_0208deec
    ldmia sp!, {r3, pc}
.L_178:
    bl func_0208de4c
    ldmia sp!, {r3, pc}
.L_180:
    bl func_0208dd9c
    ldmia sp!, {r3, pc}
.L_188:
    mov r0, #0x6600000
    ldmia sp!, {r3, pc}
.L_190:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
