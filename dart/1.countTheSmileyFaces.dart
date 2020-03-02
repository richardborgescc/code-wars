bool isValidEye(String eyes) {
  if (eyes == ':' || eyes == ';') {
    return true;
  }
  
  return false;
}

bool isValidNose(String eyes) {
  if (eyes == '-' || eyes == '~') {
    return true;
  }
  
  return false;
}

bool isValidMouth(String eyes) {
  if (eyes == ')' || eyes == 'D') {
    return true;
  }
  
  return false;
}

bool isValidFace(String face) {
  print(face);
  
  if (face.length == 2 
    && isValidEye(face[0])
    && isValidMouth(face[1])
  ) {
    return true;
  } else if (face.length == 3
    && isValidEye(face[0])
    && isValidNose(face[1])
    && isValidMouth(face[2])
  ) {
    return true;
  }
  
  return false;
}

int countSmileys(List<String> arr) {
  // your code here
  int count = 0;
  
  for (var smile in arr) {
    if (isValidFace(smile)) {
      count++;
    }
  }
  
  return count;
}