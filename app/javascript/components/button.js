const memePersonne = (word) => {
  if (document.getElementById('customer_contact_last_name_contact')!== null) {
    document.getElementById(`customer_contact_last_name_${word}`).value = document.getElementById('customer_contact_last_name_contact').value;
    document.getElementById(`customer_contact_position_${word}`).value = document.getElementById('customer_contact_position_contact').value;
    document.getElementById(`customer_contact_email_${word}`).value = document.getElementById('customer_contact_email_contact').value;
    document.getElementById(`customer_contact_tel_${word}`).value = document.getElementById('customer_contact_tel_contact').value;
  }
}

const pasMemePersonne = (word) => {
  if (document.getElementById('customer_contact_last_name_contact') !== null) {
    document.getElementById(`customer_contact_last_name_${word}`).value = "";
    document.getElementById(`customer_contact_position_${word}`).value = "";
    document.getElementById(`customer_contact_email_${word}`).value = "";
    document.getElementById(`customer_contact_tel_${word}`).value = "";
  }
}

export { memePersonne, pasMemePersonne }
