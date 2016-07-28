function kitchen_converge_verify {
  kitchen converge $1 && kitchen verify $1
}
