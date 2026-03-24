import React from 'react';
import { Clock, CheckCircle2, AlertCircle, ArrowUpRight, FileText, Timer, CheckCircle, XCircle } from 'lucide-react';
import HighlightCard from './shared/HighlightCard';
import '../styles/AttendanceModule.css'; // Reusing some grid layout variables

const defaultHighlights = [
  { key: "totalHours", label: "Total Hours", icon: Clock, accentClass: "is-slate", value: "--", subValue: "N/A" },
  { key: "daysPresent", label: "Days Present", icon: CheckCircle2, accentClass: "is-green", value: "--", subValue: "N/A" },
  { key: "totalLate", label: "Total Late", icon: AlertCircle, accentClass: "is-amber", value: "--", subValue: "N/A" },
  { key: "overtime", label: "Overtime", icon: ArrowUpRight, accentClass: "is-blue", value: "--", subValue: "N/A" },
];

/**
 * Maps legacy string/emoji icons to Lucide components for consistent UI.
 */
const getIconComponent = (icon) => {
  if (typeof icon !== 'string') return icon;
  
  switch (icon) {
    case '◷': return Clock;
    case '◉': return CheckCircle2;
    case '!': return AlertCircle;
    case '↗': return ArrowUpRight;
    case '🗎': return FileText;
    case '✓': return CheckCircle;
    case '✕': return XCircle;
    default: return icon;
  }
};

/**
 * A wrapper component that renders a collection of HighlightCards.
 * Used across multiple dashboard tabs (Attendance, Requests, etc.)
 */
export default function AttendanceHistoryHighlights({ 
  highlights = defaultHighlights,
  onFilterChange = null,
  activeFilter = null
}) {
  return (
    <div 
      className="attendance-history-highlights am-stats-grid" 
      aria-label="Attendance summary highlights"
      style={{ marginBottom: '24px' }}
    >
      {highlights.map(item => (
        <HighlightCard
          key={item.key}
          id={item.key}
          label={item.labelText ?? item.label}
          value={item.value}
          subValue={item.subValue}
          icon={getIconComponent(item.icon)}
          accentClass={item.accentClass}
          isActive={activeFilter === item.key}
          onClick={onFilterChange}
        />
      ))}
    </div>
  );
}
