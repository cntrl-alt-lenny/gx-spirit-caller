; func_ov002_02292a90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_02257ab8
        .extern func_ov002_02280980
        .extern func_ov002_0228c460
        .global func_ov002_02292a90
        .arm
func_ov002_02292a90:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c460
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280980
    mvn r1, #0x1
    cmp r0, r1
    movlt r0, #0x1
    ldmltia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02257ab8
    cmp r0, #0x2
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
