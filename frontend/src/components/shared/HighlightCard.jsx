import React from 'react';
import './HighlightCard.css';

/**
 * A unified card component for summary highlights and interactive filtering.
 * Standardizes the metric view across all dashboards.
 */
export default function HighlightCard({
  id,
  label,
  value,
  subValue,
  icon: IconComponent,
  accentClass = 'is-slate',
  isActive = false,
  onClick = null,
  isOffline = false
}) {
  const isClickable = typeof onClick === 'function';
  
  const handleKeyDown = (e) => {
    if (isClickable && (e.key === 'Enter' || e.key === ' ')) {
      e.preventDefault();
      onClick(id);
    }
  };

  return (
    <article
      className={`highlight-card ${accentClass} ${isActive ? 'is-active' : ''} ${isClickable ? 'is-clickable' : ''}`}
      onClick={isClickable ? () => onClick(id) : undefined}
      onKeyDown={handleKeyDown}
      tabIndex={isClickable ? 0 : -1}
      role={isClickable ? 'button' : 'article'}
      aria-pressed={isActive}
    >
      <div className="highlight-header">
        <span className="highlight-label">{label}</span>
        {IconComponent && (
          <div className="highlight-icon-wrapper">
            <IconComponent size={20} aria-hidden="true" />
          </div>
        )}
      </div>
      
      <div className="highlight-value" aria-live="polite">
        {isOffline ? "--" : (value ?? "--")}
      </div>
      
      <div className="highlight-subvalue">
        {isOffline ? "N/A" : (subValue ?? "N/A")}
      </div>
      
      {isActive && (
        <div className="highlight-active-indicator" />
      )}
    </article>
  );
}
