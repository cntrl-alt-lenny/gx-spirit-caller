; func_ov002_02221de0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de820
        .extern func_ov002_021de8e4
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_02221de0
        .arm
func_ov002_02221de0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r1, #0x0
    mov r2, r1
    mov r4, r0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_64
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
    beq .L_64
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021de8e4
.L_64:
    mov r0, r4
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_c4
    mov r0, r4
    mov r1, #0x1
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
    beq .L_c4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021de820
.L_c4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
