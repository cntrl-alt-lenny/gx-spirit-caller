; func_ov007_021b2d00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202160c
        .extern func_0202165c
        .global func_ov007_021b2d00
        .arm
func_ov007_021b2d00:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov fp, #0x3
    mov sl, r1
    mov r9, r2
    mov r8, #0x0
    mov r5, #0xd
    mvn r4, #0x19
    mov r7, fp
.L_e4:
    mov r0, sl
    mov r1, r7
    mov r2, r8
    bl func_0202160c
    movs r6, r0
    beq .L_140
    mov r1, r5
    mov r2, r9
    bl func_0202165c
    mov r0, r6
    mov r1, fp
    mov r2, #0x0
    bl func_0202165c
    mov r0, r6
    mov r1, #0x4
    mov r2, #0x0
    bl func_0202165c
    mov r0, r6
    mov r1, #0x5
    mov r2, r4
    bl func_0202165c
    add r8, r8, #0x1
    b .L_e4
.L_140:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
