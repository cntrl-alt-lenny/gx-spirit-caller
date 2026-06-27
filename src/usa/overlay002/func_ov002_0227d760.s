; func_ov002_0227d760 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0228ccb0
        .extern func_ov002_0228cf9c
        .global func_ov002_0227d760
        .arm
func_ov002_0227d760:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r2
    rsb r4, r6, #0x1
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_0228ccb0
    cmp r0, #0x0
    blt .L_40
    and r1, r4, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_40:
    mov r0, r6
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_0228cf9c
    cmp r0, #0x0
    mvnlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    and r1, r6, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r4, r5, r6, pc}
