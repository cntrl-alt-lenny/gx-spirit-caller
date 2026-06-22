; func_ov002_02221ed0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de910
        .extern func_ov002_021de9d4
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_02221ed0
        .arm
func_ov002_02221ed0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r1, #0x0
    mov r2, r1
    mov r4, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_64
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_64
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021de9d4
.L_64:
    mov r0, r4
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_c4
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_c4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021de910
.L_c4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
