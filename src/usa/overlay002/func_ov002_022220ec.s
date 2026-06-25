; func_ov002_022220ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de3e8
        .extern func_ov002_021df728
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_022220ec
        .arm
func_ov002_022220ec:
    stmdb sp!, {r4, r5, r6, lr}
    mov r1, #0x0
    mov r2, r1
    mov r6, r0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_84
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_84
    bl func_ov002_021e2a4c
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021de3e8
    cmp r0, #0x0
    beq .L_80
    mov r0, r6
    mov r1, r4
    mov r2, #0x1f4
    bl func_ov002_021df728
.L_80:
    bl func_ov002_021e2b6c
.L_84:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
