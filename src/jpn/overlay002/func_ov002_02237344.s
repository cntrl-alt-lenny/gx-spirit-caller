; func_ov002_02237344 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c83ac
        .extern func_ov002_021df728
        .extern func_ov002_021e267c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_02237344
        .arm
func_ov002_02237344:
    stmdb sp!, {r4, r5, r6, lr}
    mov r1, #0x0
    mov r2, r1
    mov r4, r0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_75c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_75c
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c83ac
    add r2, r0, r0, lsr #0x1f
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, r2, asr #0x1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df728
.L_75c:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_788
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021e267c
.L_788:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
