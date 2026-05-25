        .text
        .extern data_ov002_022d0252
        .extern func_ov002_021b3d2c
        .global func_ov002_021b4254
        .arm
func_ov002_021b4254:
    ldr r2, .L_021b4268
    mov r0, r0, lsl #0x2
    ldr ip, .L_021b426c
    ldrh r0, [r2, r0]
    bx ip
.L_021b4268: .word data_ov002_022d0252
.L_021b426c: .word func_ov002_021b3d2c
