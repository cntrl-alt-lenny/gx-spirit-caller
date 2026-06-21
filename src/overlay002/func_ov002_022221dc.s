; func_ov002_022221dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de4d8
        .extern func_ov002_021df818
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_022221dc
        .arm
func_ov002_022221dc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r1, #0x0
    mov r2, r1
    mov r6, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_84
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_84
    bl func_ov002_021e2b3c
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021de4d8
    cmp r0, #0x0
    beq .L_80
    mov r0, r6
    mov r1, r4
    mov r2, #0x1f4
    bl func_ov002_021df818
.L_80:
    bl func_ov002_021e2c5c
.L_84:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
