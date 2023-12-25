/** Radio channels */
export const CHANNELS = ['Say', 'Radio', 'Me', 'OOC', 'Admin'] as const;

/** Window sizes in pixels */
export enum WINDOW_SIZES {
  small = 30,
  medium = 50,
  large = 70,
  width = 380,
}

/** Line lengths for autoexpand */
export enum LINE_LENGTHS {
  small = 38,
  medium = 76,
}

/**
 * Radio prefixes.
 * Contains the properties:
 * id - string. css class identifier.
 * label - string. button label.
 */
export const RADIO_PREFIXES = {
  '; ': {
    id: 'radio',
    label: 'Com',
  },
  ':b ': {
    id: 'binary',
    label: '0101',
  },
  ':c ': {
    id: 'command',
    label: 'Cmd',
  },
  ':e ': {
    id: 'engi',
    label: 'Engi',
  },
  ':m ': {
    id: 'medical',
    label: 'Med',
  },
  ':n ': {
    id: 'science',
    label: 'Sci',
  },
  ':o ': {
    id: 'ai',
    label: 'AI',
  },
  ':s ': {
    id: 'security',
    label: 'Sec',
  },
  ':x ': {
    id: 'syndicate',
    label: 'Syndi',
  },
  ':b': {
    id: 'syndicate',
    label: 'Burg',
  },
  ':q ': {
    id: 'syndicate',
    label: 'Ninja',
  },
  ':t': {
    id: 'syndicate',
    label: 'Merc',
  },
  ':q': {
    id: 'syndicate',
    label: 'Pen',
  },
  ':y ': {
    id: 'hail',
    label: 'Hail',
  },
  ':z ': {
    id: 'ent',
    label: 'Ent',
  },
  ':u ': {
    id: 'supply',
    label: 'Ops',
  },
  ':v ': {
    id: 'service',
    label: 'Svc',
  },
} as const;
