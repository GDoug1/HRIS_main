export const formatFullDate = (value) => {
  if (!value) return "—";
  const date = new Date(String(value).replace(" ", "T"));
  if (isNaN(date.getTime())) return "—";
  
  return date.toLocaleDateString("en-US", {
    weekday: "short",
    month: "long",
    day: "numeric",
    year: "numeric"
  });
};

export const formatDateTime = (value) => {
  const dateStr = formatFullDate(value);
  if (dateStr === "—") return dateStr;
  
  const date = new Date(String(value).replace(" ", "T"));
  const timeStr = date.toLocaleTimeString("en-US", {
    hour: "numeric",
    minute: "2-digit"
  });
  
  return `${dateStr} at ${timeStr}`;
};
